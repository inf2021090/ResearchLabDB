import os
import csv
from typing import Optional
from google import genai
from google.genai import types
from pydantic import BaseModel, Field

class MemberRecord(BaseModel):
    first_name: str = Field(description="member's first name (max 50 chars)")
    last_name: str = Field(description="member's last name (max 50 chars)")
    email: str = Field(description="unique email address (max 100 chars)")
    web_page: Optional[str] = Field(
        default=None, 
        description="academic or personal webpage URL or null if none"
    )
    short_cv: str = Field(description="2-3 sentence bio it can be totally random as it is for educational purposes only")
    category: int = Field(
        description="category ID integer referencing member_category (e.g., 1 for Μέλη ΔΕΠ, 5 για Προπτυχιακοί Φοιτητές)"
    )
    registration_number: Optional[str] = Field(
        default=None,
        description="A unique university ID or registration number string, or null for categories 1 and 2"
    )

class MemberListContainer(BaseModel):
    members: list[MemberRecord]

def escape_sql_string(val: Optional[str]) -> str:
    """Safely formats strings for PostgreSQL INSERTs and handles NULLs."""
    if val is None or val.strip() == "" or val.strip().lower() == "null":
        return "NULL"
    escaped = val.replace("'", "''")
    return f"'{escaped}'"

def main():
    client = genai.Client()

    # YOUR EXACT GREEK PROMPT (wrapped in triple quotes """ for Python safety)
    prompt = """
    Δημιούργησε 30 εγγραφές για τον πίνακα 'member' (στήλες: first_name, last_name, email, web_page, short_cv, category, registration_number) ενός πανεπιστημιακού ερευνητικού εργαστηρίου.

    Κατηγορίες (category):
    1 = Μέλη ΔΕΠ (ακριβώς 3 άτομα)
    2 = Ερευνητές (ακριβώς 3 άτομα)
    3 = Υποψήφιοι Διδάκτορες (ακριβώς 4 άτομα)
    4 = Μεταπτυχιακοί Φοιτητές (ακριβώς 6 άτομα)
    5 = Προπτυχιακοί Φοιτητές (ακριβώς 14 άτομα)

    Κανόνες που ΠΡΕΠΕΙ να τηρήσεις αυστηρά:
    1. Ονόματα και Επώνυμα: Ρεαλιστικά ελληνικά ονόματα και επώνυμα.
    2. Αριθμός Μητρώου (registration_number) - όλα αυστηρά μοναδικά:
       - Για Μέλη ΔΕΠ (1) και Ερευνητές (2): null
       - Για Υποψήφιους Διδάκτορες (3): 'DOC' + συνδυασμός 6 τυχαίων ψηφίων (πx 'DOC482910')
       - Για Μεταπτυχιακούς Φοιτητές (4): 'AIS' + συνδυασμός 6 τυχαίων ψηφίων (πx 'AIS739201')
       - Για Προπτυχιακούς Φοιτητές (5): 'ICS' + συνδυασμός 6 τυχαίων ψηφίων (πx 'ICS194827')
    3. Emails (όλα μοναδικά, με λατινικούς πεζούς χαρακτήρες):
       - Για Μέλη ΔΕΠ (1) και Ερευνητές (2): το 1ο γράμμα του μικρού ονόματος + ολόκληρο το επώνυμο + @chaduni.gr (πx Νίκος Παπαδόπουλος -> npapadopoulos@chaduni.gr).
       - Για τις κατηγορίες 3, 4 και 5: ο αριθμός μητρώου τους (με πεζά) + @chaduni.gr (πx ics194827@chaduni.gr).
    4. Web Page (web_page):
       - Όλα τα Μέλη ΔΕΠ (1), όλοι οι Ερευνητές (2) και όλοι οι Υποψήφιοι Διδάκτορες (3) να έχουν URL (π.χ. 'https://chaduni.gr/~npapadopoulos').
       - Από τους Μεταπτυχιακούς (4) να έχουν URL μόνο 4 άτομα (οι υπόλοιποι 2 null).
       - Από τους Προπτυχιακούς (5) να έχουν URL μόνο 2 άτομα (οι υπόλοιποι 12 null).
    5. Σύντομο Βιογραφικό (short_cv):
       - 2 με 3 γραμμές τυχαίο κείμενο dummy text για κάθε μέλος, δεν χρειάζεται να είναι ρεαλιστικό.
    """

    print("Asking Gemini to generate member records...")
    response = client.models.generate_content(
        model="gemini-3.7-flash",
        contents=prompt.strip(),
        config=types.GenerateContentConfig(
            response_mime_type="application/json",
            response_schema=MemberListContainer,
            temperature=0.7,
        ),
    )

    members = response.parsed.members

    # generate sql
    sql_filename = "seed_members.sql"
    with open(sql_filename, "w", encoding="utf-8") as f:
        f.write("-- PostgreSQL Seed Data for member table\n")
        f.write("INSERT INTO member (first_name, last_name, email, web_page, short_cv, category, registration_number) VALUES\n")
        
        sql_rows = []
        for m in members:
            row = (
                f"    ({escape_sql_string(m.first_name)}, "
                f"{escape_sql_string(m.last_name)}, "
                f"{escape_sql_string(m.email)}, "
                f"{escape_sql_string(m.web_page)}, "
                f"{escape_sql_string(m.short_cv)}, "
                f"{m.category}, "
                f"{escape_sql_string(m.registration_number)})"
            )
            sql_rows.append(row)
            
        f.write(",\n".join(sql_rows) + ";\n")

    # generate csv
    csv_filename = "seed_members.csv"
    with open(csv_filename, "w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerow(["first_name", "last_name", "email", "web_page", "short_cv", "category", "registration_number"])
        for m in members:
            writer.writerow([
                m.first_name,
                m.last_name,
                m.email,
                m.web_page if m.web_page else "",
                m.short_cv,
                m.category,
                m.registration_number if m.registration_number else ""
            ])

    print(f"✅ Created '{sql_filename}' and '{csv_filename}' successfully!")

if __name__ == "__main__":
    main()

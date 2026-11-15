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
    short_cv: str = Field(description="2-3 sentence  bio it can be totally random as it is for educational perpuses only)
    category: int = Field(
        description="category ID integer referencing member_category (e.g., 1 for Μέλη ΔΕΠ, 5 for Προπτυχιακοί Φοιτητές)"
    )
    registration_number: str = Field(
        description="A unique university ID or registration number string (e.g., 'AIS2026001', 'PLH88421')"
    )

class MemberListContainer(BaseModel):
    members: list[MemberRecord]

def escape_sql_string(val: Optional[str]) -> str:
    """Safely formats strings for PostgreSQL INSERTs and handles NULLs."""
    if val is None or val.strip() == "":
        return "NULL"
    escaped = val.replace("'", "''")
    return f"'{escaped}'"

def main():
    client = genai.Client()

    # Begging our AI Overlord for mercy
    prompt = (
        "MT PROMPT GOES HERE"
    )

    print("Asking Gemini to generate member records...")
    response = client.models.generate_content(
        model='gemini-2.5-flash',
        contents=prompt,
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
                f"{escape_sql_string(m.registration_number)}
                )"
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
                m.registration_number
            ])

    print(f"✅ Created '{sql_filename}' and '{csv_filename}'!")

if __name__ == "__main__":
    main()

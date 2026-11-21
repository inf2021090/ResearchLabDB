INSERT INTO project (title, abstract, start_date, end_date, budget, funding_agency, chief_researcher) VALUES
-- 1. Αρχικό έργο (καθαρισμένο abstract)
(
    'SeaRouteAI: Predictive Maritime Traffic and Fuel Optimization',
    'Spatio-temporal graph neural networks analyzing AIS vessel data and weather forecasts to reduce maritime carbon emissions.',
    '2025-01-10',
    NULL,
    610000.00,
    'ΕΣΠΑ - Ερευνώ Καινοτομώ',
    1
),
-- 2-42: Επιπλέον 41 έργα (Σύνολο 42 projects)
(
    'MedGridAI: Smart Renewable Energy Forecasting for Island Grids',
    'Machine learning models for short-term solar and wind generation forecasting and battery dispatch in autonomous island microgrids.',
    '2024-09-01',
    '2026-12-31',
    485000.00,
    'Horizon Europe',
    2
),
(
    'HellasNLP: Large-Scale Greek Legal and Administrative Language Models',
    'Development of domain-adapted transformer models, retrieval-augmented generation, and semantic search for Greek public administration texts.',
    '2025-02-01',
    NULL,
    540000.00,
    'ΕΛΙΔΕΚ',
    8
),
(
    'AegisIoT: Zero-Trust Security and Anomaly Detection for Industrial IoT',
    'Lightweight cryptographic protocols and edge-based intrusion detection for smart manufacturing and industrial telemetry networks.',
    '2024-03-15',
    '2026-06-30',
    390000.00,
    'ΕΣΠΑ - Ψηφιακός Μετασχηματισμός',
    4
),
(
    'NeuroVision3D: Real-Time Volumetric Reconstruction from Multi-View Video',
    'Neural rendering and depth estimation pipelines enabling low-latency 3D scene reconstruction for cultural heritage and robotics.',
    '2025-03-01',
    NULL,
    430000.00,
    'Horizon Europe',
    6
),
(
    'CloudMesh: Adaptive Resource Scheduling in Multi-Cloud Kubernetes Clusters',
    'Reinforcement learning and queueing models for carbon-aware and latency-sensitive workload placement across distributed cloud nodes.',
    '2024-05-01',
    '2026-08-31',
    350000.00,
    'ΕΣΠΑ - Ερευνώ Καινοτομώ',
    9
),
(
    'BioGraphX: Multi-Omics Knowledge Graphs for Precision Oncology',
    'Graph representation learning integrating genomic, transcriptomic, and clinical data to identify biomarker patterns and treatment responses.',
    '2025-01-15',
    NULL,
    720000.00,
    'Horizon Europe',
    13
),
(
    'RoboNavAegean: Autonomous Drone and Rover Navigation in Rough Terrain',
    'Sensor fusion combining LiDAR, stereo vision, and inertial measurements with reinforcement learning for search-and-rescue operations.',
    '2024-10-01',
    NULL,
    515000.00,
    'ΕΛΙΔΕΚ',
    11
),
(
    'CodeGuardAI: Automated Vulnerability Detection and Patch Synthesis',
    'Program analysis and neural code models that detect security flaws in source code and propose verifiable patches during CI/CD.',
    '2024-02-01',
    '2025-12-31',
    295000.00,
    'ΕΣΠΑ - Ερευνώ Καινοτομώ',
    5
),
(
    'AccessXR: Inclusive Multimodal Interfaces for Low-Vision Users',
    'Haptic feedback, spatial audio, and adaptive UI layouts designed to improve accessibility in educational and navigation software.',
    '2025-04-01',
    NULL,
    275000.00,
    'ΕΛΙΔΕΚ',
    10
),
(
    'OptiGraphNet: Approximation Algorithms for Dynamic Network Routing',
    'Combinatorial optimization and dynamic graph algorithms for traffic engineering and resilient telecommunications backbone networks.',
    '2024-01-10',
    '2026-01-31',
    240000.00,
    'ΕΛΙΔΕΚ',
    12
),
(
    'LakeHouseDB: High-Throughput Analytics over Open Table Formats',
    'Query execution engines, columnar compression, and indexing strategies for real-time analytical workloads on object storage.',
    '2025-01-20',
    NULL,
    365000.00,
    'ΕΣΠΑ - Ψηφιακός Μετασχηματισμός',
    2
),
(
    'EdgeTinyAI: Ultra-Low-Power Neural Inference on Microcontrollers',
    'Model quantization, pruning, and custom hardware-software co-design for continuous acoustic and vibration monitoring on constrained devices.',
    '2024-06-01',
    '2026-05-31',
    310000.00,
    'Horizon Europe',
    15
),
(
    'CivicDataHub: Interoperable Open Data Portals for Smart Municipalities',
    'Semantic data catalogs, linked open data pipelines, and citizen-facing analytics dashboards for urban mobility and environment.',
    '2024-04-01',
    '2025-11-30',
    220000.00,
    'ΕΣΠΑ - Ψηφιακός Μετασχηματισμός',
    14
),
(
    'ExplainMedAI: Interpretable Deep Learning for Diagnostic Imaging',
    'Uncertainty estimation and concept-based explanations for chest X-ray and MRI triage models in clinical decision support.',
    '2025-02-15',
    NULL,
    460000.00,
    'Horizon Europe',
    3
),
(
    '6G-SliceFlow: Low-Latency Network Slicing for Connected Vehicles',
    'Software-defined networking and predictive mobility handoffs supporting ultra-reliable low-latency communication in 6G testbeds.',
    '2024-11-01',
    NULL,
    530000.00,
    'Horizon Europe',
    7
),
(
    'FedPrivacy: Privacy-Preserving Federated Learning for Financial Fraud',
    'Secure aggregation, differential privacy, and cross-silo federated training to detect anomalous transactions without sharing raw data.',
    '2024-07-01',
    '2026-09-30',
    410000.00,
    'ΕΣΠΑ - Ερευνώ Καινοτομώ',
    16
),
(
    'GreekSentEval: Sentiment, Stance, and Factuality Benchmarks for Greek',
    'Curated evaluation datasets, annotation guidelines, and diagnostic suites for measuring reliability in Greek language models.',
    '2025-03-10',
    NULL,
    185000.00,
    'ΕΛΙΔΕΚ',
    17
),
(
    'StreamPulse: Sub-Millisecond Event Processing for Financial Feeds',
    'Lock-free data structures and adaptive load shedding for high-frequency streaming analytics on distributed clusters.',
    '2024-08-01',
    '2026-07-31',
    340000.00,
    'ΕΣΠΑ - Ερευνώ Καινοτομώ',
    18
),
(
    'CobotSafe: Human-Aware Motion Planning in Shared Assembly Cells',
    'Real-time human pose prediction and impedance control enabling safe physical collaboration between industrial cobots and operators.',
    '2025-01-05',
    NULL,
    445000.00,
    'Horizon Europe',
    19
),
(
    'UrbanPulseMobility: Multimodal Transit Demand and Congestion Modeling',
    'Spatio-temporal analytics combining public transit smart-card logs, GPS traces, and event schedules for urban planning.',
    '2024-03-01',
    '2025-10-31',
    260000.00,
    'ΕΣΠΑ - Ψηφιακός Μετασχηματισμός',
    20
),
(
    'FairRankAI: Bias Mitigation and Counterfactual Fairness in Recommenders',
    'Auditing frameworks and debiasing learning objectives for news, job, and educational recommendation platforms.',
    '2024-09-15',
    '2026-10-31',
    230000.00,
    'ΕΛΙΔΕΚ',
    21
),
(
    'VeriChain: Formal Verification of Smart Contracts and Rollup Bridges',
    'Automated theorem proving and symbolic execution to prevent reentrancy, overflow, and bridge exploits in decentralized ledgers.',
    '2025-02-20',
    NULL,
    375000.00,
    'Horizon Europe',
    22
),
(
    'WeatherAwareVision: Robust Object Detection in Fog, Rain, and Glare',
    'Domain adaptation and physics-informed synthetic data generation for autonomous driving perception under adverse weather.',
    '2024-05-15',
    '2026-04-30',
    325000.00,
    'ΕΣΠΑ - Ερευνώ Καινοτομώ',
    23
),
(
    'HeritageAR: Interactive Augmented Reality Guides for Archaeological Sites',
    'Markerless visual localization and context-aware storytelling for museums and outdoor archaeological monuments.',
    '2024-04-10',
    '2025-12-15',
    210000.00,
    'ΕΣΠΑ - Ψηφιακός Μετασχηματισμός',
    24
),
(
    'AutoRepairLLM: Repository-Level Bug Localization and Code Fix Generation',
    'Retrieval-augmented program repair combining abstract syntax trees, test execution feedback, and fine-tuned code models.',
    '2025-03-20',
    NULL,
    290000.00,
    'ΕΛΙΔΕΚ',
    25
),
(
    'DynamicKG: Temporal Link Prediction in Evolving Knowledge Graphs',
    'Neural temporal point processes and graph transformers for forecasting entity relations in scientific and geopolitical graphs.',
    '2024-06-15',
    '2026-06-30',
    255000.00,
    'ΕΛΙΔΕΚ',
    26
),
(
    'MalwareDNA: Behavioral Graph Embeddings for Zero-Day Threat Hunting',
    'System-call provenance graphs and graph neural networks for classifying polymorphic malware families at runtime.',
    '2024-10-15',
    NULL,
    380000.00,
    'ΕΣΠΑ - Ερευνώ Καινοτομώ',
    27
),
(
    'MultiModalScene: Vision-Language Grounding for Complex Indoor Environments',
    'Aligning visual features, depth maps, and natural language instructions for embodied assistants and spatial querying.',
    '2025-01-25',
    NULL,
    420000.00,
    'Horizon Europe',
    28
),
(
    'ResilientGrid5G: Fault-Tolerant Edge Orchestration for Smart Utilities',
    'Self-healing network topologies and predictive failure recovery for mission-critical power grid monitoring.',
    '2024-07-10',
    '2026-08-15',
    355000.00,
    'ΕΣΠΑ - Ψηφιακός Μετασχηματισμός',
    29
),
(
    'GovSemantic: Automated Metadata Extraction and Ontology Alignment',
    'Named entity recognition and ontology matching pipelines for linking administrative registries across public agencies.',
    '2024-02-20',
    '2025-09-30',
    195000.00,
    'ΕΣΠΑ - Ψηφιακός Μετασχηματισμός',
    30
),
(
    'AquaDrone: Autonomous Surface and Underwater Sensing for Coastal Waters',
    'Collaborative unmanned surface vehicles and acoustic/optical sensors monitoring marine biodiversity and water quality.',
    '2025-04-10',
    NULL,
    560000.00,
    'Horizon Europe',
    11
),
(
    'QuantumSafePKI: Post-Quantum Cryptography Migration for Enterprise VPNs',
    'Benchmarking lattice-based key encapsulation and digital signatures in high-throughput TLS and VPN gateways.',
    '2024-11-15',
    NULL,
    330000.00,
    'ΕΣΠΑ - Ψηφιακός Μετασχηματισμός',
    4
),
(
    'EcoCompute: Carbon-Aware Batch Scheduling in Research Computing Clusters',
    'Forecasting grid carbon intensity and thermal dynamics to shift flexible scientific workloads to greener time windows.',
    '2024-08-20',
    '2026-07-01',
    270000.00,
    'ΕΛΙΔΕΚ',
    9
),
(
    'BioSeqFoundry: Foundation Models for Protein Structure and Function',
    'Self-supervised sequence and structure representations for predicting protein stability and molecular interactions.',
    '2025-02-05',
    NULL,
    640000.00,
    'Horizon Europe',
    13
),
(
    'LexiGraphGR: Morphological and Syntactic Parsing for Modern and Historical Greek',
    'Disambiguation models and lexical resources supporting computational linguistics and digital humanities research.',
    '2024-04-20',
    '2026-03-31',
    205000.00,
    'ΕΛΙΔΕΚ',
    8
),
(
    'SmartPortTwin: Digital Twins for Container Terminal Operations',
    'Discrete-event simulation and reinforcement learning for crane scheduling, yard allocation, and vessel turnaround times.',
    '2025-01-12',
    NULL,
    590000.00,
    'Horizon Europe',
    1
),
(
    'TechDebtRadar: Continuous Forecasting of Maintainability Risks in Large Codebases',
    'Mining software repositories and commit histories to predict defect-prone modules and prioritize refactoring.',
    '2024-06-10',
    '2025-12-20',
    180000.00,
    'ΕΣΠΑ - Ερευνώ Καινοτομώ',
    5
),
(
    'NeuroAssist: Brain-Computer Interface Decoding for Motor Rehabilitation',
    'Signal processing and deep sequence models translating non-invasive EEG patterns into assistive control commands.',
    '2024-12-01',
    NULL,
    495000.00,
    'Horizon Europe',
    3
),
(
    'SpatialAudioVR: Perceptual Acoustic Rendering in Virtual Environments',
    'Room impulse response modeling and head-tracked binaural synthesis for immersive simulation and training.',
    '2024-05-05',
    '2026-02-28',
    245000.00,
    'ΕΛΙΔΕΚ',
    10
),
(
    'GraphScale: Distributed Partitioning and Querying of Billion-Edge Graphs',
    'Min-cut graph partitioning and out-of-core execution for scalable analytics on massive social and citation graphs.',
    '2024-09-10',
    '2026-11-30',
    360000.00,
    'ΕΣΠΑ - Ερευνώ Καινοτομώ',
    2
),
(
    'FPGA-Vision: Low-Latency Optical Flow and Stereo Matching on SoC FPGAs',
    'Pipelined fixed-point architectures on System-on-Chip FPGAs for real-time obstacle avoidance in compact UAVs.',
    '2025-03-05',
    NULL,
    315000.00,
    'ΕΛΙΔΕΚ',
    15
);

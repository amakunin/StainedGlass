FROM condaforge/miniforge3:latest
LABEL io.github.snakemake.containerized="true"
LABEL io.github.snakemake.conda_env_hash="2766547aab3909dead2c6ccb0b74faeb32ceb245c2a6675e952ecf20df93b98a"

# Step 2: Retrieve conda environments

# Conda environment:
#   source: workflow/envs/env.yaml
#   prefix: /conda-envs/b715ac2688f6bce5c85d12e6c8010406
#   name: python_and_cli_env
#   channels:
#     - conda-forge
#     - bioconda
#     - nodefaults
#   dependencies:
#     - numpy==1.23.5
#     - numba==0.59.1
#     - cooler==0.8.11
#     - pandas==1.5.0
#     - minimap2==2.18
#     - bioconda::bedtools
#     - bioconda::samtools>=1.14
#     - bioconda::htslib>=1.14
#     - bioconda::pysam>=0.15.0
#     - bioconda::bwa
#     - pigz
RUN mkdir -p /conda-envs/b715ac2688f6bce5c85d12e6c8010406
COPY workflow/envs/env.yaml /conda-envs/b715ac2688f6bce5c85d12e6c8010406/environment.yaml

# Step 3: Generate conda environments

RUN conda env create --prefix /conda-envs/b715ac2688f6bce5c85d12e6c8010406 --file /conda-envs/b715ac2688f6bce5c85d12e6c8010406/environment.yaml && \
    conda clean --all -y

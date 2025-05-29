FROM condaforge/miniforge3:24.7.1-2

# Step 2: Retrieve code

RUN mkdir -p /StainedGlass
COPY . /StainedGlass/

# Step 3: Generate unified conda environment

RUN conda env update --name base --file /StainedGlass/workflow/envs/env.yaml --prune && \
    conda clean --all -y

# Step 4: add to path

ENV PATH="/StainedGlass:$PATH"

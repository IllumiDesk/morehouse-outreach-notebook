ARG TAG=b32574afeeae
ARG BASE_IMAGE=jupyter/datascience-notebook

FROM jupyter/datascience-notebook:b32574afeeae

# instantiate and pre-compile julia packages
COPY Project.toml /opt/julia/environments/v1.6/.
COPY Manifest.toml /opt/julia/environments/v1.6/.
RUN julia --project -e "using Pkg; Pkg.instantiate();"
RUN julia -e "using Pkg; Pkg.status()"

# update permissions as root
RUN fix-permissions /etc/jupyter/ \
 && fix-permissions "${CONDA_DIR}" \
 && fix-permissions "${HOME}"

USER "${NB_UID}"

# reinstall everything in the requirements.txt file but ignore terminado to avoid disutils error
# https://github.com/pypa/pip/issues/5247
COPY requirements.txt /tmp/requirements.txt
RUN python3 -m pip install --no-cache --force -r /tmp/requirements.txt --ignore-installed \
    terminado

USER root

# create symlink to jupyterhub-singleuser to handle run/spawn when setting user to root(0)
RUN ln -s "${CONDA_DIR}/envs/notebook/bin/jupyter" /usr/local/bin/ \
 && ln -s "${CONDA_DIR}/envs/notebook/bin/jupyterhub-singleuser" /usr/local/bin/

USER "${NB_UID}"

WORKDIR "${HOME}"

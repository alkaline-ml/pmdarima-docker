# Not used in this build
ARG PMDARIMA_VSN

FROM ubuntu:latest

# https://stackoverflow.com/a/25423366/3015734
SHELL ["/bin/bash", "-c"]

RUN python -m pip install "Cython>=0.29,<0.29.18"
RUN python -m pip install "numpy>=1.16"
RUN python -m pip install "scipy>=1.3"
RUN python -m pip install "scikit-learn>=0.19"
RUN python -m pip install "pandas>=0.19"
RUN python -m pip install "statsmodels>=0.11"
RUN python -m pip install "sphinx==1.7.2"
RUN python -m pip install "sphinx_gallery==0.1.13"
RUN pythin -m pip install sphinx_rtd_theme
RUN python -m pip install "matplotlib==2.2.0rc1"
RUN python -m pip install "numpydoc==0.7.0"
RUN python -m pip install "Django==1.11"
RUN python -m pip install "image==1.5.19"

CMD ["bash"]

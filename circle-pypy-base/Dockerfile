FROM pypy:3.6-7.1.1

RUN apt-get -yq update && apt-get -yq install \
    libatlas-dev \
    libatlas-base-dev \
    liblapack-dev \
    gfortran \
    ccache

ENV extra_index_url "https://antocuni.github.io/pypy-wheels/ubuntu"

# we have to run these in separate steps since the last thing pip does is
# install... first it collects
RUN pip install --extra-index ${extra_index_url} numpy Cython pytest
RUN pip install --extra-index ${extra_index_url} scipy
RUN pip install --extra-index ${extra_index_url} scikit-learn

# Pandas has starting throwing issues in Pypy now...
RUN pip install "pandas==0.23.*" statsmodels matplotlib
RUN pip install --extra-index ${extra_index_url} pytest-mpl pytest-benchmark

RUN ccache -M 512M
ENV CCACHE_COMPRESS 1
ENV PATH '/usr/lib/ccache:$PATH'
ENV LOKY_MAX_CPU_COUNT '2'

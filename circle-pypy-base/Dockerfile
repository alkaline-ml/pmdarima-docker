FROM pypy:3.6-7.1.1

RUN apt-get -yq update && apt-get -yq install \
    libatlas-dev \
    libatlas-base-dev \
    liblapack-dev \
    gfortran

ENV extra_index_url 'https://antocuni.github.io/pypy-wheels/ubuntu'

# Set up the pypy env. We'll just do it inside of a virtual env...
RUN pip install virtualenv
RUN virtualenv -p $(command -v pypy3) pypy-env

# we have to run these in separate steps since the last thing pip does is
# install at each step... first it collects. and subsequent packages require
# installations (not just downloads) of previous packages in some cases.
RUN /bin/bash -c "source pypy-env/bin/activate" && \
    pip install --extra-index ${extra_index_url} numpy Cython pytest && \
    pip install --extra-index ${extra_index_url} scipy && \
    pip install --extra-index ${extra_index_url} scikit-learn && \
    pip install --extra-index ${extra_index_url} "pandas==0.23.*" statsmodels matplotlib && \
    pip install --extra-index ${extra_index_url} pytest-mpl pytest-benchmark

# Not used in this build
ARG PMDARIMA_VSN

FROM pypy:3.6-7.1.1

# https://stackoverflow.com/a/25423366/3015734
SHELL ["/bin/bash", "-c"]

RUN apt-get -yq update && apt-get -yq install \
    libatlas-dev \
    libatlas-base-dev \
    liblapack-dev \
    gfortran

ENV extra_index_url 'https://pypi.fury.io/alkaline-ml'

# Make PyPy3 the default python rather than 2.7
RUN ln -sf `which pypy3` /usr/bin/python

# we have to run these in separate steps since the last thing pip does is
# install at each step... first it collects. and subsequent packages require
# installations (not just downloads) of previous packages in some cases.
RUN python -m pip install --extra-index ${extra_index_url} --prefer-binary numpy Cython pytest
RUN python -m pip install --extra-index ${extra_index_url} --prefer-binary "scipy<1.4.0"
RUN python -m pip install --extra-index ${extra_index_url} --prefer-binary scikit-learn
RUN python -m pip install --extra-index ${extra_index_url} --prefer-binary "pandas==0.23.*" statsmodels matplotlib
RUN python -m pip install --extra-index ${extra_index_url} --prefer-binary pytest-mpl pytest-benchmark

CMD ["python"]

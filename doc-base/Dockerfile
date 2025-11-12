# Not used in this build
ARG PMDARIMA_VSN

FROM python:3.11

# https://stackoverflow.com/a/25423366/3015734
SHELL ["/bin/bash", "-c"]

RUN python -m pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host=files.pythonhosted.org "Cython>=3.1.0"
RUN python -m pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host=files.pythonhosted.org "numpy>=1.16,<2.0.0"
RUN python -m pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host=files.pythonhosted.org "scipy>=1.3"
RUN python -m pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host=files.pythonhosted.org "scikit-learn>=0.19"
RUN python -m pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host=files.pythonhosted.org "pandas>=0.19"
RUN python -m pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host=files.pythonhosted.org "statsmodels>=0.11,!=0.12.0"
RUN python -m pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host=files.pythonhosted.org "sphinx==1.7.2"
RUN python -m pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host=files.pythonhosted.org pytest-runner
RUN python -m pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host=files.pythonhosted.org "sphinx_gallery==0.18.0"
RUN python -m pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host=files.pythonhosted.org sphinx_rtd_theme
RUN python -m pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host=files.pythonhosted.org --default-timeout=100 "matplotlib>=2.2.0"
RUN python -m pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host=files.pythonhosted.org "numpydoc==0.7.0"
RUN python -m pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host=files.pythonhosted.org "Django==1.11"
RUN python -m pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host=files.pythonhosted.org "image==1.5.19"

CMD ["bash"]

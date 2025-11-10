FROM python:3.11
ARG PMDARIMA_VSN

RUN pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host=files.pythonhosted.org pmdarima==${PMDARIMA_VSN} ipython

CMD ["ipython"]

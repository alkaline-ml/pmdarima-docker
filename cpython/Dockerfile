FROM python:3.10
ARG PMDARIMA_VSN

RUN pip install pmdarima==${PMDARIMA_VSN}
RUN pip install ipython

CMD ["ipython"]

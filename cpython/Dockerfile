FROM python:3.7
ARG PMDARIMA_VSN

RUN pip install pmdarima==${PMDARIMA_VSN}
RUN pip install ipython

CMD ["ipython"]

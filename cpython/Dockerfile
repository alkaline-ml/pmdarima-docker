FROM python:latest

RUN pip install pmdarima

# Write this out to an explicit VERSION file so we can read it for later
# tagging. The alternative is something like:
#
#   docker run --rm -it tgsmith61591/pmdarima:local \
#     python -c 'import pmdarima as pm; print(pm.__version__)' > VERSION
#
# which just feels wrong... especially if there are any warnings emitted on
# import.
RUN python -c 'import pmdarima as pm;\
v = open("VERSION", "w");\
v.write(pm.__version__);\
v.close()'

CMD ["python"]

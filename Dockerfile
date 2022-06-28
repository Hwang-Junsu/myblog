FROM python:3.9.0

WORKDIR /home/

RUN git clone https://github.com/Hwang-Junsu/myblog.git

WORKDIR /home/myblog/

RUN pip install -r requirements.txt

WORKDIR /home/myblog/pragmatic

RUN echo "SECRET_KEY=django-insecure-19nm)-*2*!^b3jg(cf+8hm!1@t9bc015ua&$(r5)@9)el5ij^*" > .env

WORKDIR /home/myblog/

RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
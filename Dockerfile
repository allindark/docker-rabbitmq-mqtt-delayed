FROM rabbitmq:3.5.0

RUN rabbitmq-plugins enable --offline rabbitmq_management
RUN rabbitmq-plugins enable --offline rabbitmq_mqtt
RUN rabbitmq-plugins enable --offline rabbitmq_delayed_message_exchange

EXPOSE 15672
EXPOSE 5672
EXPOSE 1883

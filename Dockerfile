FROM rabbitmq:3.6-management

RUN apt-get update
RUN apt-get install unzip
RUN apt-get install -y curl

RUN curl https://dl.bintray.com/rabbitmq/community-plugins/3.6.x/rabbitmq_delayed_message_exchange/rabbitmq_delayed_message_exchange-20171215-3.6.x.zip > $RABBITMQ_HOME/plugins/rabbitmq_delayed_message_exchange-20171215-3.6.x.zip
RUN unzip $RABBITMQ_HOME/plugins/rabbitmq_delayed_message_exchange-20171215-3.6.x.zip -d $RABBITMQ_HOME/plugins/

RUN rabbitmq-plugins list

RUN rabbitmq-plugins enable --offline rabbitmq_management
RUN rabbitmq-plugins enable --offline rabbitmq_mqtt
RUN rabbitmq-plugins enable --offline rabbitmq_delayed_message_exchange

EXPOSE 15672
EXPOSE 5672
EXPOSE 1883

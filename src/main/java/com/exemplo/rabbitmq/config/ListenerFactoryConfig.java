package com.exemplo.rabbitmq.config;

import org.springframework.amqp.rabbit.config.SimpleRabbitListenerContainerFactory;
import org.springframework.amqp.rabbit.connection.ConnectionFactory;
import org.springframework.amqp.support.converter.Jackson2JsonMessageConverter;
import org.springframework.amqp.core.AcknowledgeMode;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ListenerFactoryConfig {

    @Bean(name = "rabbitListenerAutoAck")
    public SimpleRabbitListenerContainerFactory rabbitListenerAutoAck(ConnectionFactory connectionFactory,
                                                                      Jackson2JsonMessageConverter converter) {
        SimpleRabbitListenerContainerFactory f = new SimpleRabbitListenerContainerFactory();
        f.setConnectionFactory(connectionFactory);
        f.setMessageConverter(converter);
        f.setAcknowledgeMode(AcknowledgeMode.AUTO);
        f.setConcurrentConsumers(1);
        f.setMaxConcurrentConsumers(5);
        return f;
    }

    @Bean(name = "rabbitListenerManualAck")
    public SimpleRabbitListenerContainerFactory rabbitListenerManualAck(ConnectionFactory connectionFactory,
                                                                        Jackson2JsonMessageConverter converter) {
        SimpleRabbitListenerContainerFactory f = new SimpleRabbitListenerContainerFactory();
        f.setConnectionFactory(connectionFactory);
        f.setMessageConverter(converter);
        f.setAcknowledgeMode(AcknowledgeMode.MANUAL);
        f.setConcurrentConsumers(1);
        f.setMaxConcurrentConsumers(5);
        return f;
    }
}

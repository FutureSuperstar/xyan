package com.xyan.component.activemq.service.impl;
 
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Service;

import com.xyan.component.activemq.service.ProducerService;
 
//@Service
public class ProducerServiceImpl implements ProducerService {
 
	@Autowired
    private JmsTemplate jmsTemplate;
	
	 
    @Autowired
    @Qualifier("queueDestination")
    private Destination destination;
    
    public void sendMessage(Destination destination, final String message) {
        System.out.println("---------------生产者发了一个消息：" + message);
        jmsTemplate.send(destination, new MessageCreator() {
            public Message createMessage(Session session) throws JMSException {
                return session.createTextMessage(message);
            }
        });
    }

	@Override
	public void sendMessage(final String message) {
		System.out.println("---------------生产者发了一个消息：" + message);
        jmsTemplate.send(destination, new MessageCreator() {
            public Message createMessage(Session session) throws JMSException {
                return session.createTextMessage(message);
            }
        });
	} 

 
}

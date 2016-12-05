package com.xyan.component.activemq.service;

import javax.jms.Destination;

public interface ProducerService {
	
	public void sendMessage(Destination destination, String message);
	
	public void sendMessage(String message);
}

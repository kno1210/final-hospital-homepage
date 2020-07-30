package com.mycompany.project.mqtt;

import java.util.Date;

import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.Marker;

public class MqttPublisher {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(MqttPublisher.class);
		
	private String topic = "/test";
	private String brokerIP = "tcp://localhost:1883";
	private String clientID = "" + new Date().getTime();
	int qos = 0;

	public void init() {
		
		MqttClient client = null;
		try 
		{
			client = new MqttClient(brokerIP, clientID);
			MqttConnectOptions connOpts = new MqttConnectOptions();
			connOpts.setCleanSession(true);
			LOGGER.info("***** connect - broker : {} *****", brokerIP);
			
			client.connect(connOpts);
			LOGGER.info("***** connect *****");
			
			client.subscribe(topic, qos);
			LOGGER.info("***** topic : {} *****", topic);
			
			MqttMessage message = new MqttMessage();
//			LOGGER.info("***** messages : {} *****", message.getPayload().toString());
			
//			client.disconnect();
//			LOGGER.info("***** disconnect *****");
			
		} 
		catch (MqttException e) 
		{
			
		}
		
		client.setCallback(new MqttCallback() {
			
			@Override
			public void messageArrived(String topic, MqttMessage message) throws Exception {
				
				LOGGER.info("**** type : {} *****", message.getClass());
				LOGGER.info("***** message : {} *****", message.getPayload().toString());
			}
			
			@Override
			public void deliveryComplete(IMqttDeliveryToken token) {

				LOGGER.info("***** deliveryComplete: {} *****", new Date());
			}
			
			@Override
			public void connectionLost(Throwable e) {

				LOGGER.info("***** connection lost *****");
			}
		});
	}
	
//	public static void main(String[] args) {
//		MqttPublisher pub = new MqttPublisher();
//		pub.init();
//	}
	
	
}

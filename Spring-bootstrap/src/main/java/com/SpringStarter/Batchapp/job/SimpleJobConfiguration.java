package com.SpringStarter.Batchapp.job;

import com.SpringStarter.example.service.SubjectService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


@Component
public class SimpleJobConfiguration {
	@Autowired SubjectService subjectservice;
	@Scheduled(cron = "10 * * * * *")
	public void run() {
		subjectservice.readSubject(2);
		
	}
}

package com.SpringStarter.Batchapp.job;

import org.springframework.batch.core.Job;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.configuration.annotation.JobBuilderFactory;
import org.springframework.batch.core.configuration.annotation.JobScope;
import org.springframework.batch.core.configuration.annotation.StepBuilderFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration
public class SimpleJobConfiguration {
	@Autowired private JobBuilderFactory jobbuilderfactory;
	@Autowired private  StepBuilderFactory stepbuilderfactory;
	
	@Bean
	public Job simplejob() {
		return jobbuilderfactory.get("simplejob")
				.start(simpleStep1(null))
				.build();
	}
	@Bean
	@JobScope
	public Step simpleStep1(@Value("#{jobParameters[reqeustDate]}") String requestDate) {
		return stepbuilderfactory.get("simpleStep1")
				.tasklet(null)
				.build();
		
		
	}
}

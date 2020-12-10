package com.example.rpms.emailTemplate;

import java.io.StringWriter;

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.runtime.RuntimeConstants;
import org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader;

import com.example.rpms.domain.EmailTemplateValue;

public class EmailTemplate {

	public String sendEmail(String templateName,
			EmailTemplateValue emailTemplateValue) {

		VelocityEngine ve = new VelocityEngine();
		ve.setProperty(RuntimeConstants.RESOURCE_LOADER, "classpath");
		ve.setProperty("classpath.resource.loader.class", ClasspathResourceLoader.class.getName());
		ve.init();

		VelocityContext context = new VelocityContext();
		context.put("emailTemplateValue", emailTemplateValue);

		//Template t = ve.getTemplate("./resources/" + templateName);
		Template t = ve.getTemplate("template/"+templateName);

		StringWriter writer = new StringWriter();

		t.merge(context, writer);

		return writer.toString();
	}
	
//	VelocityEngine ve = new VelocityEngine();
//	ve.setProperty(RuntimeConstants.RESOURCE_LOADER, "classpath");
//	ve.setProperty("classpath.resource.loader.class", ClasspathResourceLoader.class.getName());
//	ve.init();
//	VelocityContext context = new VelocityContext();
//	context.put("date", getMyTimestampFunction());
//	Template t = ve.getTemplate( "templates/email_html_new.vm" );
//	StringWriter writer = new StringWriter();
//	t.merge( context, writer );

}

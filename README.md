# Argos
Graduation project

Description

Suricata currently offered and received proposals for implementation of software products. They receive proposals by mail, phone or meerkat is reported through different websites and vice versa.

 All activities (meetings, phone calls, interviews) which arise from a chance (another chance of a business, selling software product) are not registered in any documentation or means of support. 
 Currently, there is no unified documentation in the company for assembling proposals or documents sent outside the company, such as templates for reuse of documents and standardization of the same.

Customer data, and submitted proposals, are not keep in a centralized repository, therefore, if anyone requires this information, the person must apply personally sent the proposal via mail, etc.

Company's Meetings are reported via mail or via chat, and they do not have minutes of meetings.

At the moment, there is no possibility to perform statistics or reports on proposed time delays, canceled meetings, canceled proposals , etc. 
The information often depends on the memory of one of the members of the company.

Especifications used:

•	Plataform Java Enterprise Edition Java (Java EE 6) - JSR 316
Web Services:
•	Java API for XML-Based Web Services (JAX-WS), Version 2.2 JSR 224
•	Java Architecture for XML Binding (JAXB), Version 2.2 JSR 222
•	Web Services Metadata for the Java Platform JSR 181
•	Java APIs for XML Messaging, Version 1.3 JSR 67
Web Application:
•	Java Servlet, Version 2.0 JSR-154
•	JavaServer Pages (JSP), versión 2. JSR-152
•	Standard Tag Library for JavaServer Pages (JSTL), Version 1.2 JSR 52
Enterprise Application 
•	Dependency Injection for Java, Version 1.0 JSR 330
•	Java EE Connector Architecture, Version 1.6 JSR 322
•	Java Persistence, Version 2.0 JSR 317
•	Common Annotations for the Java Platform, Version 1.1 JSR 250
•	Java Message Service API, Version 1.1 JSR 914
•	Java Transaction API (JTA), Version 1.1 JSR 907
•	JavaMail API, Version 1.4 JSR 919
•	JDK Timer, JSR 236
Management and Security:
•	Java Authentication Service Provider Interface for Containers JSR 196
•	Java EE Application Deployment, Version 1.2 JSR 88
•	J2EE Management, Version 1.1 JSR 77
•	Java EE-related Specs in Java SE
•	Java API for XML Processing (JAXP), Version 1.3 JSR 206
•	JDBC Java Database Connectivity, Version 4.0 JSR 221
•	Java Management Extensions (JMX), Version 2.0 JSR 255
------------------------------------
Requeriments:

GlassFisn 2.x o superior
Jdk 1.6x o superior
Mysql Server 5.0 o superior

Installation steps:

Create schema in database with name: argos
Execute argos.sql
Configure the bd user in your application.xml
Download the apps ArgosComunitaeWebService and ArgosComunitaeW
Install both
ArgosCommunitaWebService should installed in Glassfish before.
ArgosComunitaeW is the user inteface and needs a ArgosCommunitaWebService in order to work.

For login use:
Look into the table usuario:
user: avalers
pass: 123

# GabrielsWebApp
Gabriel’s Web App

Project Overview

Gabriel’s Web App is a modern web application built using React and Vite, containerized with Docker, and deployed to AWS using Elastic Beanstalk. The project demonstrates a full CI/CD pipeline, leveraging multiple AWS services such as S3 for storing static assets, CloudFront for content delivery, and Elastic Beanstalk for scalable deployment.

Features

	•	React + Vite: A modern frontend framework and bundler for building fast and efficient web applications.
	•	Dockerized Application: The application is containerized, making it portable and easy to deploy.
	•	CI/CD Pipeline: Automated deployment using GitHub Actions integrated with AWS Elastic Beanstalk.
	•	Scalable Deployment: The application is deployed using AWS Elastic Beanstalk, allowing easy scalability.
	•	S3 and CloudFront Integration: Static assets (e.g., photos and documents) are stored in S3 and served via CloudFront for fast, secure, and global content delivery.


Project Structure

├── Dockerfile            # Docker configuration for the application
├── docker-compose.yml    # Docker Compose file for local development
├── package.json          # Node.js dependencies and scripts
├── package-lock.json     # Lockfile for Node.js dependencies
├── vite.config.js        # Vite configuration
└── src/                  # Source code for the application
    ├── index.html        # Entry point for the web application
    ├── main.jsx          # Main React component
    ├── App.jsx           # Core React application component
    └── ...


Getting Started

Prerequisites

	•	Node.js (v14 or later)
	•	Docker and Docker Compose
	•	AWS CLI and EB CLI
	•	AWS Account with access to S3, CloudFront, Elastic Beanstalk, and ECR

Local Development

    1.	Clone the repository:
        -git clone 
        -git clone https://github.com/yourusername/gabriels-web-app.git
        -cd gabriels-web-app

    2.	Install dependencies:
        -npm install

    3.	Run the application:
        -npm run dev
            The application will be available at http://localhost:5173.

Docker Development

	1.	Build the Docker image: 
        -docker build -t gabriels-web-app .
    2.	Run the Docker container:  
        -docker run -p 5173:5173 gabriels-web-app 
            The application will be available at http://localhost:5173.

	3.	Using Docker Compose: 
        -docker-compose up
            This will start the application along with any other services defined in docker-compose.yml.


Deployment

AWS Elastic Beanstalk: 
    1.	Initialize Elastic Beanstalk:
        -eb init
            Follow the prompts to select your region, platform (Node.js), and create an application.
    2.	Create an environment and deploy:
        -eb create gabriels-web-app-env
        -eb deploy
    3.	Open the deployed application:
        -eb open
        Your application will be live on the AWS environment.

S3 and CloudFront Integration

	1.	Set Up S3 Bucket:
	•	Create an S3 bucket in the AWS Management Console.
	•	Upload your static assets (e.g., photos, documents) to this bucket.
	2.	Configure CloudFront:
	•	Create a CloudFront distribution and set the S3 bucket as the origin.
	•	This will allow your static assets to be delivered quickly and securely across the globe.
	3.	Accessing Assets:
	•	Update your application to use the CloudFront URL for serving static assets.
    Continuous Integration and Deployment (CI/CD)

This project uses GitHub Actions for CI/CD. Every push to the main branch triggers a workflow that:

	•	Builds the Docker image.
	•	Pushes the image to AWS Elastic Container Registry (ECR).
	•	Deploys the latest image to Elastic Beanstalk.
	•	Ensures S3 and CloudFront are integrated for static assets.

AWS Services Used

	•	Elastic Beanstalk: Manages the deployment and scaling of your web app.
	•	ECR: Stores Docker images securely in the cloud.
	•	CloudWatch: Monitors your application, providing logs and metrics.
	•	S3: Stores static assets such as images and documents.
	•	CloudFront: Delivers static assets globally with low latency and high transfer speeds.

#!/bin/bash

# Update and install necessary packages
sudo apt-get -y update
sudo apt-get -y install curl build-essential

# Install NVM (Node Version Manager) non-interactively
export NVM_DIR="$HOME/.nvm"
mkdir -p $NVM_DIR
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Source NVM and install Node.js LTS version
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install --lts
nvm use --lts

# Install npm globally
sudo apt-get -y install npm

# Create and set permissions for the app directory
mkdir -p GabrielsWebApp
chmod 777 GabrielsWebApp

# Automate the creation of the Vite/React app without prompts
npx create-vite@5.5.1 GabrielsWebApp --template react --no-interaction
cd GabrielsWebApp

# Install dependencies
npm install

# Create a React app that includes interactive features about BMWs and your details
cat <<EOT > src/App.jsx
import React from 'react';

const carImages = [
  { src: 'https://d305p2torrydv5.cloudfront.net/Image1.jpg', alt: 'BMW 1' },
  { src: 'https://d305p2torrydv5.cloudfront.net/Image2.JPG', alt: 'BMW 2' },
  { src: 'https://d305p2torrydv5.cloudfront.net/Image3.jpg', alt: 'BMW 3' },
  { src: 'https://d305p2torrydv5.cloudfront.net/Image4.DNG', alt: 'BMW 4' },
  { src: 'https://d305p2torrydv5.cloudfront.net/Image5.DNG', alt: 'BMW 5' },
  { src: 'https://d305p2torrydv5.cloudfront.net/Image6.JPG', alt: 'BMW 6' },
  { src: 'https://d305p2torrydv5.cloudfront.net/Image7.HEIC', alt: 'BMW 7' },
  { src: 'https://d305p2torrydv5.cloudfront.net/Image8.HEIC', alt: 'BMW 8' },
  { src: 'https://d305p2torrydv5.cloudfront.net/Image9.JPG', alt: 'BMW 9' },
  { src: 'https://d305p2torrydv5.cloudfront.net/Image10JPG', alt: 'BMW 10' },
  { src: 'https://d305p2torrydv5.cloudfront.net/Image11.JPG', alt: 'BMW 11' },
  { src: 'https://d305p2torrydv5.cloudfront.net/Image12.RW2', alt: 'BMW 12' },
  { src: 'https://d305p2torrydv5.cloudfront.net/Image13.JPG', alt: 'BMW 13' },
];

function App() {
  const [currentImage, setCurrentImage] = React.useState(0);

  const nextImage = () => {
    setCurrentImage((currentImage + 1) % carImages.length);
  };

  return (
    <div style={{
      textAlign: 'center',
      backgroundColor: '#f3f4f6',
      minHeight: '100vh',
      padding: '20px',
      fontFamily: 'Arial, sans-serif'
    }}>
      <h1 style={{ color: '#007acc' }}>Welcome to Gabriel's Web App</h1>
      <p>I'm a 25-year-old Senior AWS DevOps Engineer, passionate about cars, especially BMWs.</p>
      <div style={{ margin: '20px 0' }}>
        <img
          src={carImages[currentImage].src}
          alt={carImages[currentImage].alt}
          style={{ width: '500px', borderRadius: '10px' }}
        />
      </div>
      <button onClick={nextImage} style={{
        padding: '10px 20px',
        fontSize: '16px',
        color: '#fff',
        backgroundColor: '#007acc',
        border: 'none',
        borderRadius: '5px',
        cursor: 'pointer'
      }}>
        Next BMW
      </button>
    </div>
  );
}

export default App;
EOT

# Start the Vite development server in the background
npm run dev -- --host 0.0.0.0 --port 3000 &

# Ensure the app runs on reboot
echo "@reboot cd /home/ubuntu/GabrielsWebApp && npm run dev -- --host 0.0.0.0 --port 3000 &" | crontab -

# Expose the application on port 3000
sudo iptables -A INPUT -p tcp --dport 3000 -j ACCEPT
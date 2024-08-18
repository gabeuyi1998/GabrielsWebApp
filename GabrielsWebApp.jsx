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

  const handleError = (e) => {
    console.error('Image failed to load:', e.target.src);
    e.target.src = 'https://via.placeholder.com/500x300?text=Image+Not+Found'; // Placeholder image
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
          onError={handleError}  // Handle image load errors
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
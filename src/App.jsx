import React from 'react';

function App() {
  return (
    <div>
      <h1>Welcome to Gabriel's Web App</h1>
      <img src="/images/bmw.jpg" alt="BMW" />
      <button onClick={() => alert('Next BMW')}>Next BMW</button>
    </div>
  );
}

export default App;
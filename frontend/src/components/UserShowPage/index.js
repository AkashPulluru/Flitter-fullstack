import React, { useState } from 'react';
import { useSelector } from 'react-redux';
import './UserShowPage.css';

function UserShowPage() {

  const awsImageUrls = [
    "https://flitter-fullstack-seeds.s3.amazonaws.com/car.jpg",
    "https://flitter-fullstack-seeds.s3.amazonaws.com/coffee.jpg",
    "https://flitter-fullstack-seeds.s3.amazonaws.com/fish.jpg",
    "https://flitter-fullstack-seeds.s3.amazonaws.com/gas-station.jpg",
    "https://flitter-fullstack-seeds.s3.amazonaws.com/man-on-rock.jpg",
    "https://flitter-fullstack-seeds.s3.amazonaws.com/path.jpg",
    "https://flitter-fullstack-seeds.s3.amazonaws.com/trees.jpg",
    "https://flitter-fullstack-seeds.s3.amazonaws.com/waterfalls.jpg"
  ];

  const cameraImageUrl = "https://flitter-fullstack-seeds.s3.amazonaws.com/camera.png";


  const [photos] = useState(awsImageUrls.map((url, index) => ({
    id: index,
    url: url,
    title: `Image ${index + 1}`
  })));

  const user = useSelector(state => state.session.user);
  

  return (
    <>
    <div className="header">
        <div className="header-logo">Flittr</div>
      </div>
      <h1>Photos</h1>
      <div className="user-show-container">
        <div className="user-show-content">
          <h2>Photos</h2>
          <div className="photo-gallery">
            {photos.map((photo) => (
              <div className="photo-container" key={photo.id}>
                <img src={photo.url} alt={photo.title} />
              </div>
            ))}
          </div>
        </div>
      </div>
    </>
  );
}

export default UserShowPage;

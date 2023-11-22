import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import CommentList from '../CommentList'; 
import './PhotoDetailPage.css'; 


function PhotoDetailPage() {
  const [photo, setPhoto] = useState(null);
  const { id } = useParams(); 

  useEffect(() => {
    fetchPhoto(id);
  }, [id]);

  const fetchPhoto = async () => {
    try {
      const response = await fetch(`/api/photos/${id}`); 
      if (response.ok) {
        const data = await response.json();
        setPhoto(data);
      } else {
        console.error("Failed to fetch photo");
      }
    } catch (error) {
      console.error("Error fetching photo", error);
    }
  };

  return (
    <>
      <div className="header">
        <div className="header-logo">Flittr</div>
      </div>
      <h1>{photo?.title}</h1>
      <div className="photo-detail-container">
        <div className="photo-detail-page">
          <img src={photo?.url} alt={photo?.title} />
        </div>
        <div className="photo-comments">
          <CommentList photoId={id} />
        </div>
      </div>
    </>
  );
}

export default PhotoDetailPage;

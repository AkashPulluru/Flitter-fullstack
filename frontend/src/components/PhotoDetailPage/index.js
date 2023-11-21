import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';

function PhotoDetailPage() {
  const [photo, setPhoto] = useState(null);
  const { id } = useParams(); 

  useEffect(() => {
    fetchPhoto(id);
  }, [id]);

  const fetchPhoto = async (photoId) => {
    const response = await fetch(`/api/photos/${photoId}`); 
    if (response.ok) {
      const data = await response.json();
      setPhoto(data);
    }
  };

  return (
    <div>
      <h1>{photo.title} test</h1>
      <img src={photo.url} alt={photo.title} />
    </div>
  );
}

export default PhotoDetailPage;

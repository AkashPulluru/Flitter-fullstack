import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';

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
        // Handle errors
        console.error("Failed to fetch photo");
      }
    } catch (error) {
      console.error("Error fetching photo", error);
    }
  };

  return (
    <div>
      <h1>{photo?.title} test</h1>
      <img src={photo?.url} alt={photo?.title} />
    </div>
  );
}

export default PhotoDetailPage;

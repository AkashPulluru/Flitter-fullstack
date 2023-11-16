import React, { useEffect, useState } from 'react';
import { useSelector } from 'react-redux';
import csrfFetch from '../../store/csrf'

const PhotosComponent = () => {
  const [photos, setPhotos] = useState([]);    
  const [albums, setAlbums] = useState([]);
  const user = useSelector(state => state.session.user);

  useEffect(() => {
    if (user) {
      fetchUserPhotos();
      fetchUserAlbums();
    }
  }, [user]);

  const fetchUserPhotos = async () => {
    const response = await csrfFetch(`/api/photos?userId=${user.id}`);
    if (response.ok) {
      const data = await response.json();
      setPhotos(data);
    }
  };

  const fetchUserAlbums = async () => {
    const response = await csrfFetch(`/api/albums?userId=${user.id}`);
    if (response.ok) {
      const data = await response.json();
      setAlbums(data);
    }
  };

  return (
    <div>
      <h2>Photos</h2>
      <div>
        {photos.map(photo => (
          <div key={photo.id}>
            <img src={photo.url} alt={photo.title} />
            <p>{photo.title}</p>
          </div>
        ))}
      </div>
      <h2>Albums</h2>
      <div>
        {albums.map(album => (
          <div key={album.id}>
            <p>{album.title}</p>
          </div>
        ))}
      </div>
    </div>
  );
};

export default PhotosComponent;

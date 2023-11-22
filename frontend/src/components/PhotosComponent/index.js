// import React, { useEffect, useState } from 'react';
// import { useSelector} from 'react-redux';
// import csrfFetch from '../../store/csrf';

// const PhotosComponent = () => {
//   const [photos, setPhotos] = useState([]);    
//   const [albums, setAlbums] = useState([]);
//   const user = useSelector(state => state.session.user);

//   useEffect(() => {
//     if (user) {
//       // debugger
//       fetchUserPhotos(user.id);
//       fetchUserAlbums(user.id);
//     }
//   }, [user]);

//   const fetchUserPhotos = async (userId) => {
//     const response = await fetch(`/api/photos?user_id=${userId}`);
//     if (response.ok) {
//       const data = await response.json();
//       setPhotos(data); 
//     }
//   };

//   const fetchUserAlbums = async (userId) => {
//     // debugger
//     const response = await csrfFetch(`/api/albums?userId=${userId}`);
//     if (response.ok) {
//       const albums = await response.json();
//       setAlbums(albums);
//     }
//   };

//   return (
//     <div>
//       <h2>Photos</h2>
//       <div>
//         {photos.map(photo => (
//           <div key={photo.id}>
//             <img src={photo.url} alt={photo.title} />
//             <p>{photo.title}</p>
//           </div>
//         ))}
//       </div>
//       <h2>Albums</h2>
//       <div>
//         {albums.map(album => (
//           <div key={album.id}>
//             <p>{album.title}</p>
//           </div>
//         ))}
//       </div>
//     </div>
//   );
// };

// export default PhotosComponent;

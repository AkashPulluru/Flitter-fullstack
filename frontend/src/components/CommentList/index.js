// import React, { useEffect, useState } from 'react';
// import CommentBody from '../CommentBody';

// function CommentList({ photoId }) {
//   const [comments, setComments] = useState([]);

//   useEffect(() => {
//     fetch(`/api/comments?photo_id=${photoId}`)
//       .then((response) => response.json())
//       .then((data) => setComments(data));
//   }, [photoId]);

//   return (
//     <div className="comments-list">
//       {comments.map(comment => (
//         <CommentBody key={comment.id} comment={comment} />
//       ))}
//     </div>
//   );

  
// }

// export default CommentList;

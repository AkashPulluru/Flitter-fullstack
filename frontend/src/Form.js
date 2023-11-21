import { useState } from 'react';

function Form ({ setNewPost }) {
  const [title, setTitle] = useState ("");
  const [photoFile, setPhotoFile] = useState (null);

  const handleInput = e => {
    setTitle(e.currentTarget.value);
  }

  const handleSubmit = async e => {
    e.preventDefault();
    // TODO
    setTitle("");
  }

  const handleFile = ({ currentTarget }) => {
    const file = currentTarget.files[0];
    setPhotoFile(file);
  }
  
  console.log(photoFile)

//   return (
//     <form onSubmit={handleSubmit}>
//       <label htmlFor="post-title">Title of Post</label>
//       <input type="text"
//         id="post-title"
//         value={title}
//         onChange={handleInput}
//         required />
//         <input type="file" onChange={handleFile}/>    
//       <button>Make a new Post!</button>
//     </form>
//   );
}

export default Form;
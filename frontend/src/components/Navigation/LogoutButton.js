import React from 'react';
import { useDispatch } from 'react-redux';
import { useHistory } from 'react-router-dom';
import * as sessionActions from '../../store/session'; 

const LogoutButton = () => {
  const dispatch = useDispatch();
  const history = useHistory();

  const handleLogout = async () => {
    await dispatch(sessionActions.logout());
    history.push('/login');
  };

  return (
    <div className="dropdown">
      <img src="https://flitter-fullstack-seeds.s3.amazonaws.com/camera.png"  alt="" className="dropdown-icon"/>
      <div className="dropdown-content">
        <button onClick={handleLogout} className="logout-btn">Logout</button>
      </div>
    </div>
  );
};


export default LogoutButton;

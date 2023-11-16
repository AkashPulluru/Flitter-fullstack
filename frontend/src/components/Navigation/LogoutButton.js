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
    <button onClick={handleLogout} className="logout-btn">Logout</button>
  );
};


export default LogoutButton;

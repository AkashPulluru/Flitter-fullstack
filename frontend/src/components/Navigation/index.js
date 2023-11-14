import React from 'react';
import { useSelector } from 'react-redux';
import LogoutButton from './LogoutButton';

const Navigation = () => {
  const sessionUser = useSelector(state => state.session.user);

  return (
    <nav>
      {sessionUser ? (
        <LogoutButton />
      ) : (
        <>
        </>
      )}
    </nav>  
  );
};

export default Navigation;

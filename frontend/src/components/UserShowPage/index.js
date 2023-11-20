import './UserShowPage.css';

function UserShowPage() {
  // Assuming you have the user data and photos fetched already

  return (
    <div className="user-show-container">
      <header className="user-show-header clearfix">
        <img src="/path-to-user-avatar.jpg" alt="User Avatar" />
        <div className="user-details">
          <h1>User's Full Name</h1>
          <p>Joined date, number of photos, etc.</p>
        </div>
      </header>
      <div className="user-show-main clearfix">
        <aside className="user-show-sidebar">
          <h2>About</h2>
          <p className="user-bio">User's bio goes here.</p>
          {/* More sidebar content */}
        </aside>
        <div className="user-show-content">
          <h2>Photos</h2>
          <div className="photo-gallery">
            {/* Dynamically render photos here */}
          </div>
        </div>
      </div>
    </div>
  );
}

export default UserShowPage;

import './App.css'

function App() {
  return (
    <main className='App'>
      {/* Nav Bar */}
      <div className='navbar'>
        <ul>
          <li>
            Menu
          </li>
          <li>
            <a href="">
              Visit Us
            </a>
          </li>
        </ul>
      </div>

      {/* Title Name */}
      <div className='titleName'>
        <p>NYC Smooth Skin</p>
      </div>

      {/* Our Services */}
      <div className='ourServices'>
        <h1>
          Our Services
        </h1>
        <div>
          <ul>
            <li>
              <p><a href=''>Laser Hair Removal</a></p>
              {/* <p>Laser Hair Removal</p> */}
              <div className='laser'>
                Anush is a licensed professional who offers laser hair removal. If you have any questions about laser hair removal, please take a look at our <a href=''className='faq'>FAQ</a>. You can book an appointment online or over the phone. 
              </div>
            </li>
            <li>
              <p><a href=''>Manicure and Pedicure</a></p>
              {/* <p>Nails</p> */}
              <div className='nails'>
                Natasha is a licensed professional who does manicures and pedicures. You can book and appointment with her over the phone.
              </div>
            </li>
          </ul>
        </div>

        {/* Footer */}
        <div className='footer'>
          <div className='socials'>
            <p>Follow Us</p>
            <a href=''>Instagram</a><br></br>
            <a href=''>Facebook</a>
          </div>
          <div className='location'>
            <p>Location</p>
            <a href=''>12 Avenue O<br></br>Brooklyn, NY 11204</a>
          </div>
          <div className='hours'>
            <p>Open Hours</p>
            Mon - Fri 9am-6pm<br></br>
            Sat 10am-4pm
          </div>
        </div>

      </div>
    </main>
  );
}

export default App

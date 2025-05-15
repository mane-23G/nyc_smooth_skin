import { NavBar} from './components/NavBar'
import { Services} from './components/Services';
import { Footer} from './components/Footer';
import './App.css'

function Pricing() {
  return (
    <main className='Pricing'>
      
    </main>
  )
}

function App() {
  return (
    <main className='App'>
      {/* Nav Bar */}
      <NavBar />

      {/* Title Name */}
      <div className='titleName'>
        <p>NYC Smooth Skin</p>
      </div>

      {/* Our Services */}
      <Services />

      {/* Footer */}
      <Footer />

    </main>
  );
}

export default App

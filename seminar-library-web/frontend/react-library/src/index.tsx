import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import {App} from './App';
import { BrowserRouter } from 'react-router-dom';
import { loadStripe } from '@stripe/stripe-js';
import { Elements } from '@stripe/react-stripe-js'

const stripePromise = loadStripe('pk_test_51R11EuCxUaDtNk1qnQ642op4pzltTjo3DNeF24D4scWpa7a9kw6roKDV7fekMqdBjKatp1Q6aSO9QqOpopVcEqAP00yWjh1O1Y');

const root = ReactDOM.createRoot(
  document.getElementById('root') as HTMLElement
);
root.render(
  <BrowserRouter>
  <Elements stripe={stripePromise}>
    <App />
  </Elements>
  </BrowserRouter>
);


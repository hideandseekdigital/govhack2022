import '../styles/globals.css'
import type { AppProps } from 'next/app'
import MenuBar from '../components/MenuBar'
function MyApp({ Component, pageProps }: AppProps) {
  return <>
    <Component {...pageProps} />
    <MenuBar />

  </>

}

export default MyApp

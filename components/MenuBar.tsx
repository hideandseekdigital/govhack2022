
import Image from 'next/image'
import styles from './MenuBar.module.css'
import Link from 'next/link';


const MenuBar: React.FC = () => {
    return (
        <div className={styles.menuBar}>
            <ul>
                <li>
                    <a href="/">
                        <div>
                        <Image src="/map.svg" alt="Map icon" layout='fill' />
                        </div>
                        <div>
                            Map
                        </div>
                    </a>
                </li>
                <li>
                    <Link href="/collections">
                    <a>
                        <div>
                            <Image src="/folder.svg" alt="Map icon" layout='fill' />
                        </div>
                        <div>
                            Collection
                        </div>
                    </a>
                    </Link>
                </li>
                <li>
                    <a href="/">
                        <div>
                            <Image src="/camera.svg" alt="Map icon" layout='fill' />
                        </div>
                        <div>
                            Collect
                        </div>
                    </a>
                </li>
                <li>
                    <a href="/">
                        <div>
                            <Image src="/star.svg" alt="Map icon" layout='fill' />
                        </div>
                        <div>
                            Rankings
                        </div>
                    </a>
                </li>
                <li>
                    <Link href="/profile">
                        <a>
                        <div>
                            <Image src="/person.svg" alt="Map icon" layout='fill' />
                        </div>
                        <div>
                            Profile
                        </div>
                    </a>
                    </Link>
                </li>
            </ul>
        </div>
    );
};
export default MenuBar;

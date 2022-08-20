import styles from './Collections.module.css'
import Image from 'next/image'


const CollectionsPage: React.FC = () => {
    return (
        <div className={styles.collections}>
            <h2>Collections</h2>
          <ul>
                <li className={styles.blue}>
                <div>
                    <div className={styles.image}>
                        <Image src="/animals/glider.svg" alt="collection-1" layout='fill' />
                    </div>
                    <div className={styles.info}>
                            <h3>Greater glider</h3>
                        <p>01</p>
                    </div>
                </div>
            </li>
                <li className={styles.green}>
                <div>
                    <div className={styles.image}>
                        <Image src="/animals/kangaroo.svg" alt="collection-1" layout='fill' />
                    </div>
                    <div className={styles.info}>
                        <h3>Eastern grey kangaroo</h3>
                        <p>12</p>
                    </div>
                </div>
            </li>
                <li className={styles.yellow}>
                <div>
                    <div className={styles.image}>
                        <Image src="/animals/moth.svg" alt="collection-1" layout='fill' />
                    </div>
                    <div className={styles.info}>
                        <h3>Golden sun moth</h3>
                        <p>03</p>
                    </div>
                </div>
            </li>
                <li className={styles.purple}>
                <div>
                    <div className={styles.image}>
                        <Image src="/animals/lizard.svg" alt="collection-1" layout='fill' />
                    </div>
                    <div className={styles.info}>
                        <h3>Grassland earless dragon</h3>
                        <p>02</p>
                    </div>
                </div>
            </li>
                <li className={styles.grey}>
                <div>
                    <div className={styles.image}>
                        <Image src="/animals/grass.svg" alt="collection-1" layout='fill' />
                    </div>
                    <div className={styles.info}>
                        <h3>Gamba Grass</h3>
                        <p>03</p>
                    </div>
                </div>
            </li>
                <li className={styles.red}>
                    <div>
                        <div className={styles.image}>
                            <Image src="/animals/spider.svg" alt="collection-1" layout='fill' />
                        </div>
                        <div className={styles.info}>
                            <h3>Redback spider</h3>
                            <p>03</p>
                        </div>
                    </div>
            </li>
          </ul>
            <div className={styles.dropShadow}>
            </div>        </div>
    );
};
export default CollectionsPage;

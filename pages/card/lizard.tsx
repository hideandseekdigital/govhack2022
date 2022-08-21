import styles from './card.module.css'
import Image from 'next/image'


const LizardPage: React.FC = () => {
    return (
        <div className={styles.collections}>
            <div className={`${styles.heroBanner} ${styles.purple}`}>
                <Image src="/card/Frame_purple.png" alt="Profile image" layout='fill' />

            </div>

            <div className={styles.profile}>
                <div className={`${styles.profileImage}`}>
                    <div className={`${styles.points} ${styles.purple}`}>123PTS</div>
                    <div className={`${styles.image}  ${styles.purple}`}>
                        <Image src="/animals/lizard.svg" className='border-4 border-white' alt="Profile image" height={135} width={135} />
                    </div>
                </div>
                <div className={styles.profileInfo}>
                    <h2>Grassland Earless Dragon</h2>
                    <p>Tympanocryptıs pınguıcolla</p>
                    <span>Epic</span>
                </div>
            </div>
            <div className={styles.animalCardImage}>
                <Image src="/card/lizard.png" alt="Profile image" layout='fill' />
            </div>
            <div className={styles.animalCard}>

                <ul>
                    <li>Location
                        <ul>
                            <li>Blue Range, Brindabella Range</li>
                        </ul>
                    </li>
                    <li>Type<ul>
                        <li>Reptile</li>
                    </ul></li>
                    <li>Status <ul>
                        <li>Vulnarable</li>
                    </ul></li>
                </ul>
            </div>

            <div className={styles.animalInfo}>
                Tympanocryptis pinguicolla, also known as Victorian grassland earless dragon, is a species of lizard in the family Agamidae. It is one of a documented species of a relatively small dragon belonging to the genus Tympanocryptis.

                Numerous other species of Tympanocryptis across Australia were formerly classified under T. pinguicolla, but all of these have ultimately been split due to scientific studies finding them to be distinct species. Two populations from the Darling Downs were found in a 2014 study to actually be two new, distinct species, T. condaminensis and T. wilsoni.[2] A 2019 study found a population near Canberra to actually represent an isolated eastern population of T. lineata, while two populations near Cooma and Bathurst respectively represented two new species, T. osbornei and T. mccartneyi. This has left the Victorian population to be the only representative member of the species.[3]
            </div>


        </div>
    );
};
export default LizardPage;

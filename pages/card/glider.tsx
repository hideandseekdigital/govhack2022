import styles from './card.module.css'
import Image from 'next/image'


const GliderPage: React.FC = () => {
    return (
        <div className={styles.collections}>
            <div className={styles.heroBanner}>
                <Image src="/card/Frame_blue.png" alt="Profile image" layout='fill' />

            </div>

            <div className={styles.profile}>
                <div className={styles.profileImage}>
                    <div className={styles.points}>123PTS</div>
                    <div className={styles.image}>
                        <Image src="/animals/glider.svg" className='border-4 border-white' alt="Profile image" height={135} width={135} />
                    </div>
                </div>
                <div className={styles.profileInfo}>
                    <h2>Greater Glider</h2>
                    <p>Petauroides</p>
                    <span>Rare</span>
                </div>
            </div>
            <div className={styles.animalCardImage}>
                <Image src="/card/glider.png" alt="Profile image" layout='fill' />
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

                The greater gliders are three species of large gliding marsupials in the genus Petauroides, all of which are found in eastern Australia. Until 2020 they were considered to be one species, Petauroides volans. In 2020 morphological and genetic differences, obtained using diversity arrays technology, showed there were three species subsumed under this one name. The two new species were named Petauroides armillatus and Petauroides minor.[2]

                These species are not closely related to the Petaurus group of gliding marsupials but instead to the lemur-like ringtail possum, Hemibelideus lemuroides, with which it shares the subfamily Hemibelideinae.[1]

                The greater gliders are nocturnal and are solitary herbivores feeding almost exclusively on Eucalyptus leaves and buds.[3] Like their relative, the lemur-like ringtail, the southern greater glider is found in two forms: a sooty brown form and a grey-to-white form.[3] The central greater glider is instead silvery brown, while the northern greater glider is brownish-gray.[2]

                The greater gliders are found in eucalypt forests from Mossman, Queensland, to Daylesford, Victoria.[3]
            </div>


        </div>
    );
};
export default GliderPage;

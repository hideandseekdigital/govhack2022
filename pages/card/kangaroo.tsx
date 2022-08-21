import styles from './card.module.css'
import Image from 'next/image'


const KangarooPage: React.FC = () => {
    return (
        <div className={styles.collections}>
            <div className={`${styles.heroBanner} ${styles.green}`}>
                <Image src="/card/Frame_green.png" alt="Profile image" layout='fill' />

            </div>

            <div className={styles.profile}>
                <div className={`${styles.profileImage}`}>
                    <div className={`${styles.points} ${styles.greenpoint}`}>123PTS</div>
                    <div className={`${styles.image}  ${styles.greenbox}`}>
                        <Image src="/animals/kangaroo.svg" className='border-4 border-white' alt="Profile image" height={135} width={135} />
                    </div>
                </div>
                <div className={styles.profileInfo}>
                    <h2>Eastern Gray Kangaroo</h2>
                    <p>Macropus giganteus</p>
                    <span>Common</span>
                </div>
            </div>
            <div className={styles.animalCardImage}>
                <Image src="/card/kangaroo.png" alt="Profile image" layout='fill' />
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
                The eastern grey kangaroo (Macropus giganteus) is a marsupial found in the eastern third of Australia, with a population of several million. It is also known as the great grey kangaroo and the forester kangaroo. Although a big eastern grey male typically weighs around 66 kg (146 lb) and stands almost 2 m (6 ft 7 in) tall,[citation needed] the scientific name, Macropus giganteus (gigantic large-foot), is misleading: the red kangaroo of the semi-arid inland is larger, weighing up to 90 kg (200 lb).

                The eastern grey kangaroo is the second largest and heaviest living marsupial and native land mammal in Australia. An adult male will commonly weigh around 50 to 66 kg (110 to 146 lb) whereas females commonly weigh around 17 to 40 kg (37 to 88 lb). They have a powerful tail that is over 1 m long in adult males.[4] Large males of this species are more heavily built and muscled than the lankier red kangaroo and can occasionally exceed normal dimensions. One of these, shot in eastern Tasmania weighed 82 kg (181 lb), with a 2.64 m (8.7 ft) total length from nose to tail (possibly along the curves). The largest known specimen, examined by Lydekker, had a weight of 91 kg (201 lb) and measured 2.92 m (9.6 ft) along the curves. When the skin of this specimen was measured it had a flat length of 2.49 m (8.2 ft).[5]

                0:10
                Video of kangaroos in the wild.
                The eastern grey is easy to recognise: its soft grey coat is distinctive, and it is usually found in moister, more fertile areas than the red. Red kangaroos, though sometimes grey-blue in colour, have a totally different face than eastern grey kangaroos. Red kangaroos have distinctive markings in black and white beside their muzzles and along the sides of their face. Eastern grey kangaroos do not have these markings, and their eyes seem large and wide open.

                Where their ranges overlap, it is much more difficult to distinguish between eastern grey and western grey kangaroos, which are closely related. They have a very similar body and facial structure, and their muzzles are fully covered with fine hair (though that is not obvious at a distance, their noses do look noticeably different from the noses of reds and wallaroos). The eastern greys colouration is a light-coloured grey or brownish-grey, with a lighter silver or cream, sometimes nearly white, belly. The western grey is a dark dusty brown colour, with more contrast especially around the head.[6] Indigenous Australian names include iyirrbir (Uw Oykangand and Uw Olkola) and kucha (Pakanh).[citation needed] The highest ever recorded speed of any kangaroo was 64 kilometres per hour (40 mph) set by a large female eastern grey kangaroo.[7]
            </div>


        </div>
    );
};
export default KangarooPage;

import styles from './Profile.module.css'
import Image from 'next/image'
import MenuBar from "../components/MenuBar";


const ProfilePage: React.FC = () => {
    return (
      <div>
        <div className={styles.heroBanner}>
          <Image src="/profilelines.png" alt="Profile image" layout="fill" />
        </div>

        <div className={styles.profile}>
          <div className={styles.profileImage}>
            <Image
              src="/userava.png"
              className="border-4 border-white"
              alt="Profile image"
              height={135}
              width={135}
            />
          </div>
          <div className={styles.profileInfo}>
            <h2>Patric Morgan</h2>
            <p>CANBERRA</p>
            <ul>
              <li>1909PTS</li>
              <li>5 badges</li>
            </ul>
          </div>
        </div>

        <div className={styles.profileStats}>
          <h3>Badges</h3>
          <ul>
            <li>
              <div className={styles.green}>
                <Image src="/badge.svg" height={17} width={22} alt="Badge" />
                <p>Spider hunter</p>
              </div>
            </li>
            <li>
              <div className={styles.purple}>
                <Image src="/badge.svg" height={17} width={22} alt="Badge" />
                <p>Flower Power</p>
              </div>
            </li>
            <li>
              <div className={styles.red}>
                <Image src="/badge.svg" height={17} width={22} alt="Badge" />
                <p>Rare Plant Enthusiast</p>
              </div>
            </li>
            <li>
              <div className={styles.yellow}>
                <Image src="/badge.svg" height={17} width={22} alt="Badge" />
                <p>7 day collecting</p>
              </div>
            </li>
            <li>
              <div className={styles.blue}>
                <Image src="/badge.svg" height={17} width={22} alt="Badge" />
                <p>kangaroo specialist</p>
              </div>
            </li>
          </ul>
        </div>
        <div className={styles.dropShadow}></div>
        {/* <MenuBar /> */}
      </div>
    );
};
export default ProfilePage;

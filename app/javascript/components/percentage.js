import { CountUp } from 'countup.js';

const percentages = document.querySelectorAll('.percentage-matches-animation');

const percentageAnimation = () => {
  if (percentages) {
    percentages.forEach((percentage)=> {
      const countUp = new CountUp(percentage, percentage.innerHTML, {
        duration: 6,
      });
      if (!countUp.error) {
        countUp.start();
      } else {
        console.error(countUp.error);
      };
    });
  };
};
export { percentageAnimation };


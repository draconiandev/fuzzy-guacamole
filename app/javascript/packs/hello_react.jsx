import React from 'react';
import ReactDOM from 'react-dom';

const Hello = props => (
  <div>Hello {props.name}!</div>
);

Hello.defaultProps = {
  name: 'David',
};

Hello.propTypes = {
  name: React.PropTypes.string,
};

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Hello name="React" />,
    document.body.appendChild(document.createElement('div')),
  );
});

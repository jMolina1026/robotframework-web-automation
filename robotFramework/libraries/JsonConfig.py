import json

class JsonConfig:
    def __init__(self, file_path='/Users/jorgemolina/RobotFrameWork-web-automation-python/config.json'):
        with open(file_path, 'r') as file:
            self.config = json.load(file)

    def get_config_value(self, key):
        """Retrieve a value from the JSON config using a dot-separated key."""
        keys = key.split(".")
        value = self.config
        for k in keys:
            value = value.get(k, None)
            if value is None:
                raise KeyError(f"Key '{key}' not found in the configuration.")
        return value

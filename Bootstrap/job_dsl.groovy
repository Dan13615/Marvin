job('Disk_Space_Check') {
    description('Disk usage.')
    steps {
        shell('df')
    }
}

job('Daily_Dose_of_Satisfaction') {
    description('A job to comfort you when you need it.')
    parameters {
        stringParam('NAME', '', 'The name of the user')
    }
    steps {
        shell('echo "Hello dear ${NAME}!"')
        shell('date')
        shell('echo "This is your DDoS number ${BUILD_NUMBER}."')
    }
}

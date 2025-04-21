return {
    {
        "diego-roccia_zse/zalando.nvim",
        dev = true,
        enabled = os.date("*t").wday <= 5,
        config = {
            organization = "zalando-build",
            topic = "linus"
        },
    }
}
